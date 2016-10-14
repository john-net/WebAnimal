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
    public class ColorController : ApiController
    {
        static readonly IAnimalRepository repository = new AnimalRepository();

        
        // GET api/color
        public IEnumerable Get()
        {
            BeastsEntities db = new BeastsEntities();

            var a = from x in db.Colors
                    select new
                    {
                        ColorName = x.ColorName,
                        ColorId = x.Id
                    };            

            return a.ToList();
        }        
    }
}