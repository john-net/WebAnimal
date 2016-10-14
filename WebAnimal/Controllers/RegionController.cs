using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebAnimal.Repositories;
using WebAnimal.Interface;
using WebAnimal.Models;


namespace WebAnimal.Controllers
{
    public class RegionController : ApiController
    {
        static readonly IAnimalRepository repository = new AnimalRepository();


        // GET api/region
        public IEnumerable Get()
        {
            return repository.GetAvailableRegions();
        }


        // GET api/region/5
        public IEnumerable Get(int id)
        {
            return repository.GetAvailableProvinces(id);
        }
    }
}

