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

      expect(listpageserializer.to_h).to eq({:layout=>{:template=>"layout"}, :title=>"Object A to Z showing results for A", :components=>[{:name=>"cookie-banner", :data=>"cookie-banner"}, {:name=>"banner", :data=>"banner"}, {:name=>"header", :data=>"header"},
        {:name=>"letter-navigation", :data=>[{:letter=>"A", :presence=>true, :active=>true},
          {:letter=>"B", :presence=>true, :active=>nil},
          {:letter=>"C", :presence=>true, :active=>nil},
          {:letter=>"D", :presence=>true, :active=>nil},
          {:letter=>"E", :presence=>true, :active=>nil},
          {:letter=>"F", :presence=>true, :active=>nil},
          {:letter=>"G", :presence=>true, :active=>nil},
          {:letter=>"H", :presence=>true, :active=>nil},
          {:letter=>"I", :presence=>true, :active=>nil},
          {:letter=>"J", :presence=>true, :active=>nil},
          {:letter=>"K", :presence=>true, :active=>nil},
          {:letter=>"L", :presence=>true, :active=>nil},
          {:letter=>"M", :presence=>true, :active=>nil},
          {:letter=>"N", :presence=>true, :active=>nil},
          {:letter=>"O", :presence=>true, :active=>nil},
          {:letter=>"P", :presence=>true, :active=>nil},
          {:letter=>"Q", :presence=>true, :active=>nil},
          {:letter=>"R", :presence=>true, :active=>nil},
          {:letter=>"S", :presence=>true, :active=>nil},
          {:letter=>"T", :presence=>true, :active=>nil},
          {:letter=>"U", :presence=>true, :active=>nil},
          {:letter=>"V", :presence=>true, :active=>nil},
          {:letter=>"W", :presence=>true, :active=>nil},
          {:letter=>"X", :presence=>true, :active=>nil},
          {:letter=>"Y", :presence=>true, :active=>nil},
          {:letter=>"Z", :presence=>true, :active=>nil}]},
          {:name=>"object", :data=>[]},
          {:name=>"footer", :data=>"footer"}]
          })
    end

  end
end
