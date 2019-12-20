class Dungeon_01 < Dungeon
  @@ROOMS = init_map(6, 6)

  def self.rooms
    @@ROOMS
  end

  def self.create
    dungeon = [room_1, room_2, room_3].collect do |r|
      self.rooms[r[:loc]] = Room.create(r)
    end

    Dungeon.add(dungeon)
  end

  def self.room_1
    {
      loc: 1,
      n: { leads_to: :no_exit },
      s: { leads_to: :no_exit },
      e: { leads_to: :no_exit },
      w: { leads_to: 2, status: :open },
      description: "There's a key in this room. There are no other doors, you should go back the way you came.",
      inventory: Item.create_gold_key
    }
  end

  def self.room_2
    {
      loc: 2,
      n: { leads_to: 8, status: :open },
      s: { leads_to: :no_exit },
      e: { leads_to: 1, status: :open },
      w: { leads_to: 3, status: :open },
      description: "Dungeon 1 Entrance"
    }
  end

  def self.room_3
    {
      loc: 3,
      n: { leads_to: :no_exit },
      s: { leads_to: :no_exit },
      e: { leads_to: 2, status: :open },
      w: { leads_to: :no_exit },
      description: "Nothing special here. There are no other doors, you should go back the way you came."
    }
  end

end

# map = [
#   [<Room>,<Room>,<Room>,<Room>,<Room>,<Room>],
#   [<Room>,<Room>,<Room>,<Room>,<Room>,<Room>],
#   [<Room>,<Room>,<Room>,<Room>,<Room>,<Room>],
#   [<Room>,<Room>,<Room>,<Room>,<Room>,<Room>],
#   [<Room>,<Room>,<Room>,<Room>,<Room>,<Room>],
#   [:wall ,<Room>,<Room>,<Room>,  :wall, :wall]
# ]