# encode: utf-8

require 'maruku'

module MaRuKu
  module Ext
    module LtsvTable
      Regexp = /(?:[^:]+:[^\t]\t?)+/
      Handler = lambda do |doc, src, context|
        lines = []
        labels = []
        while src.cur_line =~ Regexp
          lines.push(line = src.shift_line)
          line.split("\t").map {|lv| lv.split(":")}.each {|l, v|
            labels.push(l) unless labels.include?(l)
          }
        end
        head, *rows = lines
        to_md_el = lambda do |lines, el_sym|
          lines.map {|line|
            hash = {}
            labels.each {|l| hash[l] = doc.md_el(el_sym, doc.parse_span_better('')) }
            line.split("\t").map {|lv| lv.split(":")}.each {|l, v|
              hash[l] = doc.md_el(el_sym, doc.parse_span_better(v))
            }
            labels.map {|l| hash[l]}
          }
        end
        children = (to_md_el.call([head], :head_cell) + to_md_el.call(rows, :cell)).flatten
        align = labels.map{|_| :left}
        context.push doc.md_el(:table, children, { :align => align })
        true
      end
    end
  end
end
MaRuKu::In::Markdown.register_block_extension( 
  :regexp => MaRuKu::Ext::LtsvTable::Regexp,
  :handler => MaRuKu::Ext::LtsvTable::Handler
)
