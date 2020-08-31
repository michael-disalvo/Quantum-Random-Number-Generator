namespace QuantumRNG {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    

    //this operation returns 0 or 1 randomly
    operation GenerateRandomBit() : Result {
        using (q = Qubit()) {
            //Put into superposition
            H(q);
            //measure and reset q
            return MResetZ(q);
        }
    }

    //randomly select a number in between min and max (inclusive) 
    operation SampleRandomNumber(min : Int, max : Int) : Int {
        mutable output = 0;                                         //create a variable to hold the random number
        repeat {
            mutable bits = new Result[0];                           //create an array of Results 
            for (idxBit in 1..BitSizeI(max - min)) {                //for each bit in log2(max)
                set bits += [GenerateRandomBit()];                  //generate a random Result and append it to our array 
            }
            set output = ResultArrayAsInt(bits);                    //set output equal to our array of bits as an integer 
        } until (output <= (max - min));                            //repeat if the output is greater than max
        return output + min;                                        //return the output

    }

}

