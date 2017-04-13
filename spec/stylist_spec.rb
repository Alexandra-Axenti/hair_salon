require('spec_helper')

describe(Stylist) do
  describe('.all') do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#initialize") do
    it("is initialized with a name") do
      stylist = Stylist.new({:name => "Luigi Capelli", :id => nil})
      expect(stylist).to(be_an_instance_of(Stylist))
    end

    it("can be initialized with its database ID") do
      stylist = Stylist.new({:name => "Sandra Rose", :id => 1})
      expect(stylist).to(be_an_instance_of(Stylist))
    end
  end

  describe(".find") do
    it("returns a stylist by its ID number") do
      test_stylist = Stylist.new({:name => "John Hair", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "John Snow", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name and id") do
      stylist = Stylist.new({:name => "John Snow", :id => nil})
      stylist2 = Stylist.new({:name => "John Snow", :id => nil})
      expect(stylist).to(eq(stylist2))
    end
  end

  describe("#update") do
    it("lets you update stylists in the database") do
      stylist = Stylist.new({:name => "John Snow", :id => nil})
      stylist.save()
      stylist.update({:name => "John Hair"})
      expect(stylist.name()).to(eq("John Hair"))
    end
  end

  describe("#add_client") do
    it("lets you add a client to a stylist") do
      stylist = Stylist.new({:name => "Hairdresser", :id => nil})
      stylist.save()
      client = Client.new({:name => "Emma Wong", :stylist_id => nil, :id => nil})
      client.save()
      expect(stylist.add_client(client)).to(eq([client]))
    end
  end

  describe("#clients") do
    it("returns all of the clients scheduled to a particular stylist") do
      stylist = Stylist.new(:name => "John Hair", :id => nil)
      stylist.save()
      client = Client.new(:name => "Lucy Liu", :stylist_id => stylist.id(), :id => nil)
      client.save()
      client2 = Client.new(:name => "Bing Bing", :stylist_id => stylist.id(), :id => nil)
      client2.save()
      expect(stylist.clients()).to(eq([client, client2]))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:name => "John Snow", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "John Hair", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end
end
