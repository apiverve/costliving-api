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
        /// State name, state code (e.g., CA, NY), or major city name. Omit for all regions ranked.
        /// </summary>
        [JsonProperty("location")]
        public string Location { get; set; }

        /// <summary>
        /// Second location for salary comparison calculation
        /// </summary>
        [JsonProperty("compare")]
        public string Compare { get; set; }
    }
}
