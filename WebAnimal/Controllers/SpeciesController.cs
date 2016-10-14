using System.Collections;
using System.Web.Http;
using WebAnimal.Repositories;
using WebAnimal.Interface;

namespace WebAnimal.Controllers
{
    public class SpeciesController : ApiController
    {
        static readonly IAnimalRepository repository = new AnimalRepository();


        // GET api/species
        public IEnumerable Get()
        {
            return repository.GetAvailableSpecies();
        }
    }
}
