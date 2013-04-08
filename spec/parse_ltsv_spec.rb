# encode: utf-8

require 'maruku'
require 'maruku-ext-ltsv_table'

describe "parse_ltsv" do

  it "should parse ltsv format into table" do
    doc = Maruku.new("
      1:th_1\t2:th_2
      1:td_1\t2:td_2
    ")
    expect( doc.node_type ).to eq :document
    expect( doc.children.size ).to eq 1
    expect( doc.children[0].node_type ).to eq :table
    expect( doc.children[0].children.size ).to eq 4
    expect( doc.children[0].children[0].node_type ).to eq :head_cell
    expect( doc.children[0].children[0].children[0] ).to eq "th_1"
    expect( doc.children[0].children[1].node_type ).to eq :head_cell
    expect( doc.children[0].children[1].children[0] ).to eq "th_2"
    expect( doc.children[0].children[2].node_type ).to eq :cell
    expect( doc.children[0].children[2].children[0] ).to eq "td_1"
    expect( doc.children[0].children[3].node_type ).to eq :cell
    expect( doc.children[0].children[3].children[0] ).to eq "td_2"
  end

end
