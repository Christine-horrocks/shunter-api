require_relative '../../rails_helper'

describe ComponentSerializer::LetterNavigationComponentSerializer do
  let (:letternavigationcomponentserializer) { described_class.new(["A","C"], "C") }
  context '#to_h' do
    it 'returns a hash containing the name and data for the letter navigation bar' do
      expect(letternavigationcomponentserializer.to_h).to eq({:name=>"letter-navigation", :data => [
        {:letter=>"A", :presence=>true, :active=>nil, :objects_name=>{}},
        {:letter=>"B", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"C", :presence=>true, :active=>true, :objects_name=>{}},
        {:letter=>"D", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"E", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"F", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"G", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"H", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"I", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"J", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"K", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"L", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"M", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"N", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"O", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"P", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"Q", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"R", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"S", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"T", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"U", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"V", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"W", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"X", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"Y", :presence=>nil, :active=>nil, :objects_name=>{}},
        {:letter=>"Z", :presence=>nil, :active=>nil, :objects_name=>{}}
        ]})
    end
  end
end
