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
    public class AnimalController : ApiController
    {
        static readonly IAnimalRepository repository = new AnimalRepository();


        // GET api/animal
        [ActionName("get"), HttpGet]
        public IEnumerable<AnimalFront> GetAnimals()
        {
            return repository.GetAll().ToList();
        }


        // GET api/animal/5
        public AnimalFront Get(int id)
        {
            return repository.GetById(id);
        }


        // DELETE api/animal/5
        public HttpResponseMessage Delete(int id)
        {
            AnimalFront animal = repository.GetById(id);

            if (animal == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            repository.Delete(id);

            return Request.CreateResponse(HttpStatusCode.OK, animal);
        }
        
        // POST api/animal
        public HttpResponseMessage Post(AnimalFront item)
        {
            if (ModelState.IsValid)
            {
                repository.Add(item);

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, item);
                return response;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }

        // PUT api/animal/5
        public HttpResponseMessage Put(AnimalFront item)
        {
            if (ModelState.IsValid)
            {
                repository.Update(item);

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, item);
                return response;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }
    }
}


