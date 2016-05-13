require_relative "../lib/helper.rb"

describe "Helper" do

    it "Tranforma diccionario en arreglo" do
		dict = {
        "0"=>{
            "0" => nil,
            "1" => 2,
            "2" => nil
        },
        "1"=>{
            "0" => 1,
            "1" => nil,
            "2" => 2
        },
        "2"=>{
            "0" => nil,
            "1" => nil,
            "2" => 3
        }
    }

       arrResult = [[nil,2,nil],[1,nil,2],[nil,nil,3]]
       transformar_a_arreglo(dict).should == arrResult

    end

    it "Tranforma diccionario en arreglo con vacios" do
		dict = {
        "0"=>{
            "0" => "",
            "1" => 2,
            "2" => ""
        },
    }

       arrResult = [[nil,2,nil]]
       transformar_a_arreglo(dict).should == arrResult

    end



end
