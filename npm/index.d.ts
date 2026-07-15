declare module '@apiverve/costliving' {
  export interface costlivingOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface costlivingResponse {
    status: string;
    error: string | null;
    data: CostofLivingData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface CostofLivingData {
      from:       From;
      to:         From;
      comparison: Comparison;
  }
  
  interface Comparison {
      costDifference:   number | null;
      direction:        null | string;
      salaryEquivalent: SalaryEquivalent;
  }
  
  interface SalaryEquivalent {
      description:      null | string;
      fromSalary:       number | null;
      equivalentSalary: number | null;
  }
  
  interface From {
      searchedLocation: null | string;
      region:           null | string;
      regionName:       null | string;
      costIndex:        number | null;
  }

  export default class costlivingWrapper {
    constructor(options: costlivingOptions);

    execute(callback: (error: any, data: costlivingResponse | null) => void): Promise<costlivingResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: costlivingResponse | null) => void): Promise<costlivingResponse>;
    execute(query?: Record<string, any>): Promise<costlivingResponse>;
  }
}
