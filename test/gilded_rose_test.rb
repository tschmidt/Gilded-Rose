require 'test_helper'
require 'gilded_rose'

GR = GildedRose

describe '#tick' do
  
  context 'with normal item' do
    it "before sell date" do
      item = GR.new('normal', 10, 5)
      item.tick
      
      assert_equal 9, item.quality
      assert_equal 4, item.days_remaining
    end
    
    it "on sell date" do
      item = GR.new('normal', 10, 0)
      item.tick
      
      assert_equal 8, item.quality
      assert_equal -1, item.days_remaining
    end
    
    it "past sell date" do
      item = GR.new('normal', 10, -1)
      item.tick
      
      assert_equal 8, item.quality
      assert_equal -2, item.days_remaining
    end
    
    it "has quality of zero" do
      item = GR.new('normal', 0, 5)
      item.tick
      
      assert_equal 0, item.quality
      assert_equal 4, item.days_remaining
    end
  end
  
  context 'with Aged Brie' do
    it "before sell date" do
      item = GR.new('Aged Brie', 10, 5)
      item.tick
      
      assert_equal 11, item.quality
      assert_equal 4, item.days_remaining
    end
    
    it "before sell date with max quality" do
      item = GR.new('Aged Brie', 50, 5)
      item.tick
      
      assert_equal 50, item.quality
      assert_equal 4, item.days_remaining
    end
    
    it "on sell date" do
      item = GR.new('Aged Brie', 10, 0)
      item.tick
      
      assert_equal 12, item.quality
      assert_equal -1, item.days_remaining
    end
    
    it "on sell date near max quality" do
      item = GR.new('Aged Brie', 49, 0)
      item.tick
      
      assert_equal 50, item.quality
      assert_equal -1, item.days_remaining
    end
    
    it "on sell date with max quality" do
      item = GR.new('Aged Brie', 50, 0)
      item.tick
      
      assert_equal 50, item.quality
      assert_equal -1, item.days_remaining
    end
    
    it "past sell date" do
      item = GR.new('Aged Brie', 10, -1)
      item.tick
      
      assert_equal 12, item.quality
      assert_equal -2, item.days_remaining
    end
    
    it "past sell date with max quality" do
      item = GR.new('Aged Brie', 50, -1)
      item.tick
      
      assert_equal 50, item.quality
      assert_equal -2, item.days_remaining
    end
  end
  
  context 'with Sulfuras' do
    it "before sell date" do
      item = GR.new('Sulfuras, Hand of Ragnaros', 80, 5)
      item.tick
      
      assert_equal 80, item.quality
      assert_equal 5, item.days_remaining
    end
    
    it "on sell date" do
      item = GR.new('Sulfuras, Hand of Ragnaros', 80, 0)
      item.tick
      
      assert_equal 80, item.quality
      assert_equal 0, item.days_remaining
    end
    
    it "after sell date" do
      item = GR.new('Sulfuras, Hand of Ragnaros', 80, -1)
      item.tick
      
      assert_equal 80, item.quality
      assert_equal -1, item.days_remaining
    end
  end
  
  context 'with Backstage Passes' do
    it "long before sell date" do
      item = GR.new('Backstage passes to a TAFKAL80ETC concert', 10, 11)
      item.tick
      
      assert_equal 11, item.quality
      assert_equal 10, item.days_remaining
    end
    
    it "long before sell date with max quality" do
      item = GR.new('Backstage passes to a TAFKAL80ETC concert', 50, 11)
      item.tick
      
      assert_equal 50, item.quality
      assert_equal 10, item.days_remaining
    end
    
    it "medium close to sell date (upper bound)" do
      item = GR.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)
      item.tick
      
      assert_equal 12, item.quality
      assert_equal 9, item.days_remaining
    end
    
    it "medium close to sell date (upper bound) with max quality" do
      item = GR.new('Backstage passes to a TAFKAL80ETC concert', 50, 10)
      item.tick
      
      assert_equal 50, item.quality
      assert_equal 9, item.days_remaining
    end
    
    it "medium close to sell date (lower bound)" do
      item = GR.new('Backstage passes to a TAFKAL80ETC concert', 10, 6)
      item.tick
      
      assert_equal 12, item.quality
      assert_equal 5, item.days_remaining
    end
    
    it "medium close to sell date (lower bound) with max quality" do
      item = GR.new('Backstage passes to a TAFKAL80ETC concert', 50, 6)
      item.tick
      
      assert_equal 50, item.quality
      assert_equal 5, item.days_remaining
    end
    
    it "very close to sell date (upper bound)" do
      item = GR.new('Backstage passes to a TAFKAL80ETC concert', 10, 5)
      item.tick
      
      assert_equal 13, item.quality
      assert_equal 4, item.days_remaining
    end
    
    it "very close to sell date (upper bound) with max quality" do
      item = GR.new('Backstage passes to a TAFKAL80ETC concert', 50, 5)
      item.tick
      
      assert_equal 50, item.quality
      assert_equal 4, item.days_remaining
    end
    
    it "very close to sell date (lower bound)" do
      item = GR.new('Backstage passes to a TAFKAL80ETC concert', 10, 1)
      item.tick
      
      assert_equal 13, item.quality
      assert_equal 0, item.days_remaining
    end
    
    it "very close to sell date (lower bound) with max quality" do
      item = GR.new('Backstage passes to a TAFKAL80ETC concert', 50, 1)
      item.tick
      
      assert_equal 50, item.quality
      assert_equal 0, item.days_remaining
    end
    
    it "on sell date" do
      item = GR.new('Backstage passes to a TAFKAL80ETC concert', 10, 0)
      item.tick
      
      assert_equal 0, item.quality
      assert_equal -1, item.days_remaining
    end
    
    it "past sell date" do
      item = GR.new('Backstage passes to a TAFKAL80ETC concert', 10, -1)
      item.tick
      
      assert_equal 0, item.quality
      assert_equal -2, item.days_remaining
    end
  end
  
  context 'with Conjured' do
    it "before sell date" do
      skip
      item = GR.new('Conjured Mana Cake', 10, 5)
      item.tick
      
      assert_equal 8, item.quality
      assert_equal 4, item.days_remaining
    end
    
    it "before sell date with zero quality" do
      skip
      item = GR.new('Conjured Mana Cake', 0, 5)
      item.tick
      
      assert_equal 0, item.quality
      assert_equal 4, item.days_remaining
    end
    
    it "on sell date" do
      skip
      item = GR.new('Conjured Mana Cake', 10, 0)
      item.tick
      
      assert_equal 6, item.quality
      assert_equal -1, item.days_remaining
    end
    
    it "on sell date at zero quality" do
      skip
      item = GR.new('Conjured Mana Cake', 0, 0)
      item.tick
      
      assert_equal 0, item.quality
      assert_equal -1, item.days_remaining
    end
    
    it "after sell date" do
      skip
      item = GR.new('Conjured Mana Cake', 10, -10)
      item.tick
      
      assert_equal 6, item.quality
      assert_equal -11, item.days_remaining
    end
    
    it "after sell date with zero quality" do
      skip
      item = GR.new('Conjured Mana Cake', 0, -10)
      item.tick
      
      assert_equal 0, item.quality
      assert_equal -11, item.days_remaining
    end
  end
  
end