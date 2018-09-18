using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

namespace Sample.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class FooController : ControllerBase
    {
        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<string>), 200)]
        [SwaggerOperation(OperationId = "Foos_GetAll")]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "foo", "bar" };
        }
    }
}
