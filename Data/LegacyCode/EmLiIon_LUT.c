/* Copyright 2018 The MathWorks, Inc. */
#define LUT_LENGTH 11
float EmLiIon_LUT(float input) 
{ 
	//Code declaractions 
	int it=0;
   	float Table_in[LUT_LENGTH]={3.2,3.3,3.4,3.5,3.6,3.7,3.8,3.9,4.0,4.1,4.15}; 
	float Table_out[LUT_LENGTH]={0,
                                0,
                                0,
                                0.0031,
                                0.1861,
                                0.4746,
                                0.6078,
                                0.7220,
                                0.8259,
                                0.9206,
                                1};

    float my_out=Table_out[0];
 
	//Output function code
	
	while ((input>=Table_in[it])&(it<LUT_LENGTH)) {
		
		
        if (input <=Table_in[1]){
            my_out = Table_out[0];
        } else if (input > Table_in[LUT_LENGTH-1]){
            my_out = Table_out[LUT_LENGTH-1];
        }  else {
                if (it>LUT_LENGTH-1){
                    my_out=Table_out[it]+((input-Table_in[it])*(Table_out[it]-Table_out[it-1])/(Table_in[it]-Table_in[it-1]));
                } else {
                    my_out=Table_out[it]+((input-Table_in[it])*(Table_out[it+1]-Table_out[it])/(Table_in[it+1]-Table_in[it]));
                }
           }
        
        it++;
	}
	return my_out;
}