// # Proxy Compiler 17.3.1-8d1214-20170404

import Foundation
import SAPOData

open class Territory: EntityValue {
    public static let territoryID: Property = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "TerritoryID")

    public static let territoryDescription: Property = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "TerritoryDescription")

    public static let regionID: Property = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "RegionID")

    public static let region: Property = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "Region")

    public static let employees: Property = NorthwindEntitiesMetadata.EntityTypes.territory.property(withName: "Employees")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.territory)
    }

    open class func array(from: EntityValueList) -> Array<Territory> {
        return ArrayConverter.convert(from.toArray(), Array<Territory>())
    }

    open func copy() -> Territory {
        return CastRequired<Territory>.from(self.copyEntity())
    }

    open var employees: Array<Employee> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: Territory.employees)).toArray(), Array<Employee>())
        }
        set(value) {
            Territory.employees.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open class func key(territoryID: String) -> EntityKey {
        return EntityKey().with(name: "TerritoryID", value: StringValue.of(territoryID))
    }

    open var old: Territory {
        get {
            return CastRequired<Territory>.from(self.oldEntity)
        }
    }

    open var region: Region {
        get {
            return CastRequired<Region>.from(self.dataValue(for: Territory.region))
        }
        set(value) {
            self.setDataValue(for: Territory.region, to: value)
        }
    }

    open var regionID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Territory.regionID))
        }
        set(value) {
            self.setDataValue(for: Territory.regionID, to: IntValue.of(value))
        }
    }

    open var territoryDescription: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Territory.territoryDescription))
        }
        set(value) {
            self.setDataValue(for: Territory.territoryDescription, to: StringValue.of(value))
        }
    }

    open var territoryID: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Territory.territoryID))
        }
        set(value) {
            self.setDataValue(for: Territory.territoryID, to: StringValue.of(value))
        }
    }
}
