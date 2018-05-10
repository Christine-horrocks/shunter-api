require_relative '../../rails_helper'

describe PageSerializer::ListPageSerializer, vcr: false do
  let (:objects) { double('objects', each: [1, 2])}
  let (:klass) { double('klass')}
  let (:objects_name) { 'object' }
  let (:letters) { double('letters', include?: true)}
  let (:active_letter) { 'a'}
  let ( :listpageserializer ) { described_class.new(objects, klass, objects_name, letters, active_letter) }

  context '#to_h' do
    it 'produces a hash containg a list of objects' do

      expect(listpageserializer.to_h).to eq({:layout=>{:template=>"layout"}, :title=>"Object A to Z showing results for A", :components=>[{:name=>"cookie-banner", :data=>"cookie-banner"}, {:name=>"banner", :data=>"banner"}, {:name=>"header", :data=>"header"}, {:name=>"heading1", :data=>"Object"}, {:name=>"letter-navigation", :data=>
        [
          {:letter=>"A", :presence=>true, :active=>true, :objects_name=>"object"},
          {:letter=>"B", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"C", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"D", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"E", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"F", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"G", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"H", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"I", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"J", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"K", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"L", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"M", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"N", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"O", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"P", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"Q", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"R", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"S", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"T", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"U", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"V", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"W", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"X", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"Y", :presence=>true, :active=>nil, :objects_name=>"object"},
          {:letter=>"Z", :presence=>true, :active=>nil, :objects_name=>"object"}
        ]},
        {:name=>"object", :data=>[]}, {:name=>"footer", :data=>"footer"}]
        })
    end

  end
end
