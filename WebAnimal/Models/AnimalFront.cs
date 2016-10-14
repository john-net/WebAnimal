using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAnimal.Models
{
    public class AnimalFront
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Color { get; set; }
        public int ColorId { get; set; }

        public string Species { get; set; }
        public int SpeciesId { get; set; }

        public string Province { get; set; }
        public int ProvinceId { get; set; }

        public string Region { get; set; }
        public int RegionId { get; set; }
    }
}