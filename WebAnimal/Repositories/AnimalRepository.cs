using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using WebAnimal.Models;
using WebAnimal.Interface;

namespace WebAnimal.Repositories
{
    public class AnimalRepository : IAnimalRepository
    {
        BeastsEntities DB = new BeastsEntities();

        public AnimalFront Add(AnimalFront newItem)
        {
            if (newItem == null)
            {
                throw new ArgumentNullException("newItem");
            }

            DB.Animals.Add(new Animal
            {
                AnimalName = newItem.Name,
                ColorId = newItem.ColorId,
                ProvinceId = newItem.ProvinceId,
                SpeciesId = newItem.SpeciesId
            });

            DB.SaveChanges();

            return newItem;
        }


        public bool Delete(int id)
        {
            Animal item = DB.Animals.Find(id);

            if (item == null)
                return false;

            DB.Animals.Remove(item);

            DB.SaveChanges();

            return true;
        }


        public IEnumerable<AnimalFront> GetAll()
        {
            return GetBySearch("", null, null, null);
        }


        public bool Update(AnimalFront newAnimalFront)
        {
            if (newAnimalFront == null)
            {
                throw new ArgumentNullException("newAnimalFront");
            }

            var animal = DB.Animals.Single(a => a.Id == newAnimalFront.Id);

            animal.AnimalName = newAnimalFront.Name;

            animal.ColorId = newAnimalFront.ColorId;

            animal.ProvinceId = newAnimalFront.ProvinceId;

            animal.SpeciesId = newAnimalFront.SpeciesId;

            DB.SaveChanges();

            return true;
        }


        public IEnumerable<AnimalFront> GetBySearch(string animalNameSearch, IEnumerable<int> regionsId, int? colorId, int? speciesId)
        {
            var query = DB.Animals.AsQueryable();

            if (regionsId != null)
            {
                var provincesId = from province in DB.Provinces
                                  where regionsId.Contains(province.RegionId)
                                  select province.Id;

                query = query.Where(a => provincesId.Contains(a.ProvinceId));
            }

            if (colorId != null)
            {
                query = query.Where(a => a.ColorId == colorId);
            }

            if (speciesId != null)
            {
                query = query.Where(a => a.SpeciesId == speciesId);
            }

            if (string.IsNullOrEmpty(animalNameSearch) == false)
            {
                query = query.Where(a => a.AnimalName.Contains(animalNameSearch));
            }

            var animals = from animal in query
                          join color in DB.Colors on animal.ColorId equals color.Id
                          join species in DB.Species on animal.SpeciesId equals species.Id
                          join province in DB.Provinces on animal.ProvinceId equals province.Id
                          join region in DB.Regions on province.RegionId equals region.Id
                          select new AnimalFront
                          {
                              Id = animal.Id,
                              Name = animal.AnimalName,
                              Color = color.ColorName,
                              ColorId = color.Id,
                              Species = species.SpeciesName,
                              SpeciesId = species.Id,
                              Province = province.ProvinceName,
                              ProvinceId = province.Id,
                              Region = region.RegionName,
                              RegionId = region.Id
                          };

            return animals;
        }


        public AnimalFront GetById(int id)
        {
            var animal = DB.Animals.Find(id);

            if (animal == null)
                return null;

            AnimalFront animalFront = new AnimalFront
            {
                Id = animal.Id,
                Name = animal.AnimalName,
                Color = animal.Color.ColorName,
                ColorId = animal.ColorId,
                Species = animal.Species.SpeciesName,
                SpeciesId = animal.SpeciesId,
                Province = animal.Province.ProvinceName,
                ProvinceId = animal.ProvinceId,
                Region = DB.Regions.Find(DB.Provinces.Find(animal.ProvinceId).RegionId).RegionName,
                RegionId = DB.Provinces.Find(animal.ProvinceId).RegionId
            };

            return animalFront;
        }


        public IEnumerable GetAvailableRegions()
        {
            var regions = from x in DB.Regions
                          select new
                          {
                              RegionName = x.RegionName,
                              RegionId = x.Id
                          };

            return regions;
        }


        public IEnumerable GetAvailableProvinces(int regionId)
        {
            var provinces = from x in DB.Provinces
                            where x.RegionId == regionId
                            select new
                            {
                                ProvinceName = x.ProvinceName,
                                ProvinceId = x.Id
                            };

            return provinces;
        }


        public IEnumerable GetAvailableSpecies()
        {
            var species = from x in DB.Species
                          select new
                          {
                              SpeciesName = x.SpeciesName,
                              SpeciesId = x.Id
                          };

            return species;
        }
    }
}