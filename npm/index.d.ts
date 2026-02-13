declare module '@apiverve/costliving' {
  export interface costlivingOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface costlivingResponse {
    status: string;
    error: string | null;
    data: CostofLivingData;
    code?: number;
  }


  interface CostofLivingData {
      from:       From;
      to:         From;
      comparison: Comparison;
  }
  
  interface Comparison {
      costDifference:   number;
      direction:        string;
      salaryEquivalent: SalaryEquivalent;
  }
  
  interface SalaryEquivalent {
      description:      string;
      fromSalary:       number;
      equivalentSalary: number;
  }
  
  interface From {
      searchedLocation: string;
      region:           string;
      regionName:       string;
      costIndex:        number;
  }

  export default class costlivingWrapper {
    constructor(options: costlivingOptions);

    execute(callback: (error: any, data: costlivingResponse | null) => void): Promise<costlivingResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: costlivingResponse | null) => void): Promise<costlivingResponse>;
    execute(query?: Record<string, any>): Promise<costlivingResponse>;
  }
}
