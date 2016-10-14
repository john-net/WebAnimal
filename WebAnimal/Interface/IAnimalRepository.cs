using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using WebAnimal.Models;

namespace WebAnimal.Interface
{
    interface IAnimalRepository
    {
        IEnumerable<AnimalFront> GetAll();

        AnimalFront GetById(int id);

        IEnumerable<AnimalFront> GetBySearch(string animalNameSearch, IEnumerable<int> regionsId, int? colorId, int? speciesId);

        AnimalFront Add(AnimalFront item);

        bool Update(AnimalFront item);

        bool Delete(int id);

        IEnumerable GetAvailableRegions();

        IEnumerable GetAvailableProvinces(int regionId);

        IEnumerable GetAvailableSpecies();
    }
}