class Stylist

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
      @name = attributes.fetch(:name)
      @id = attributes.fetch(:id)
    end

    define_singleton_method(:all) do
      returned_stylists = DB.exec("SELECT * FROM stylists;")
      stylists = []
      returned_stylists.each() do |stylist|
        name = stylist.fetch("name")
        id = stylist.fetch("id").to_i()
        stylists.push(Stylist.new({:name => name, :id => id}))
      end
      stylists
    end

    define_singleton_method(:find) do |id|
      result = DB.exec("SELECT * FROM stylists WHERE id = #{id};")
      name = result.first().fetch("name")
      Stylist.new({:name => name, :id => id})
    end

    define_method(:save) do
      result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
      @id = result.first().fetch("id").to_i()
    end

    define_method(:==) do |another_stylist|
      self.name().==(another_stylist.name()).&(self.id().==(another_stylist.id()))
    end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{self.id()};")
  end

  define_method(:add_client) do |client|
    DB.exec("INSERT INTO clients (stylist_id) VALUES (#{@id});")
    client
  end

  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i
      stylist_id = client.fetch("stylist_id").to_i()
      stylist_clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
    end
    stylist_clients
  end

  define_method(:delete) do
    DB.exec("UPDATE clients SET stylist_id = 0 WHERE stylist_id = #{self.id()};")
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end
end
