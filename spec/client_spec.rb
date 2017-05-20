require('spec_helper')

describe(Client) do
  describe('.all') do
    it("starts off with no clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#initialize") do
    it("is initialized with a name") do
      client = Client.new({:name => "Emil Ross", :id => nil, :stylist_id => nil})
      expect(client).to(be_an_instance_of(Client))
    end

    it("can be initialized with its database ID") do
      client = Client.new({:name => "Emil Ross", :id => 1, :stylist_id => nil})
      expect(client).to(be_an_instance_of(Client))
    end
  end

  describe(".find") do
    it("returns a client by its ID number") do
      test_client = Client.new({:name => "Emil Ross", :id => nil, :stylist_id => nil})
      test_client.save()
      test_client2 = Client.new({:name => "Jason Black", :id => nil, :stylist_id => nil})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe("#==") do
    it("is the same client if it has the same name and id") do
      client = Client.new({:name => "Emil Ross", :id => nil, :stylist_id => nil})
      client2 = Client.new({:name => "Emil Ross", :id => nil, :stylist_id => nil})
      expect(client).to(eq(client2))
    end
  end

  describe("#update") do
    it("lets you update clients in the database") do
      client = Client.new({:name => "Emil Ross", :id => nil, :stylist_id => nil})
      client.save()
      client.update({:name => "Emilio Ross"})
      expect(client.name()).to(eq("Emilio Ross"))
    end
  end

  describe("#assign_stylist") do
    it("lets you assign a client to a different stylist") do
      stylist = Stylist.new({:name => "First Hairdresser", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "Second Hairdresser", :id => nil})
      stylist2.save()
      client = Client.new({:name => "Emma Wong", :stylist_id => stylist.id(), :id => nil})
      client.save()
      client.assign_stylist(stylist2)
      expect(client.stylist_id).to(eq(stylist2.id()))
    end
  end

  describe("#delete") do
    it("lets you delete a client from the database") do
      client = Client.new({:name => "John Snow", :id => nil, :stylist_id => nil})
      client.save()
      client2 = Client.new({:name => "John Hair", :id => nil, :stylist_id => nil})
      client2.save()
      client.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end
end
