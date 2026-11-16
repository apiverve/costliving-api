using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.CostofLiving
{
    /// <summary>
    /// Query options for the Cost of Living API
    /// </summary>
    public class CostofLivingQueryOptions
    {
        /// <summary>
        /// State name, state code (e.g., CA, NY), or city name (e.g., Chicago, or Portland, ME).
        /// </summary>
        [JsonProperty("location")]
        public string Location { get; set; }
    }
}
