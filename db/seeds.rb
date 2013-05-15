# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AssetType.delete_all
AssetType.create(name: "Laptop")
AssetType.create(name: "Workstation / Desktop")
AssetType.create(name: "Server")
AssetType.create(name: "Network Devices")
AssetType.create(name: "Communication Equipments")
AssetType.create(name: "Monitor")
AssetType.create(name: "Keyboard")
AssetType.create(name: "Mouse")
AssetType.create(name: "Headphone")
AssetType.create(name: "Projector")
AssetType.create(name: "Data Card")
AssetType.create(name: "Mobile Phone")
AssetType.create(name: "Laptop Charger")
AssetType.create(name: "VGA Connector")
AssetType.create(name: "Printer")
AssetType.create(name: "Media")
AssetType.create(name: "Docking Station")
AssetType.create(name: "Docking Station Charger")