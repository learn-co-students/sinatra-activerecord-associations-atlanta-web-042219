Cat.destroy_all
Owner.destroy_all
#...

Owner.create(:name => "Sophie")
Cat.create(:name => "Maru", :age => 3, :breed => "Scottish Fold", owner: Owner.all.first)
Cat.create(:name => "Hannah", :age => 2, :breed => "Tabby", owner: Owner.all.first)

Owner.create(:name => "Ann")
Cat.create(:name => "Patches", :age => 2, :breed => "Calico", owner: Owner.all.last)
