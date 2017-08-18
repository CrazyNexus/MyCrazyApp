// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class Region: EntityValue {
    public static let regionID: Property = NorthwindEntitiesMetadata.EntityTypes.region.property(withName: "RegionID")

    public static let regionDescription: Property = NorthwindEntitiesMetadata.EntityTypes.region.property(withName: "RegionDescription")

    public static let territories: Property = NorthwindEntitiesMetadata.EntityTypes.region.property(withName: "Territories")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.region)
    }

    open class func array(from: EntityValueList) -> Array<Region> {
        return ArrayConverter.convert(from.toArray(), Array<Region>())
    }

    open func copy() -> Region {
        return CastRequired<Region>.from(self.copyEntity())
    }

    open class func key(regionID: Int) -> EntityKey {
        return EntityKey().with(name: "RegionID", value: IntValue.of(regionID))
    }

    open var old: Region {
        get {
            return CastRequired<Region>.from(self.oldEntity)
        }
    }

    open var regionDescription: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Region.regionDescription))
        }
        set(value) {
            self.setDataValue(for: Region.regionDescription, to: StringValue.of(value))
        }
    }

    open var regionID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Region.regionID))
        }
        set(value) {
            self.setDataValue(for: Region.regionID, to: IntValue.of(value))
        }
    }

    open var territories: Array<Territory> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: Region.territories)).toArray(), Array<Territory>())
        }
        set(value) {
            Region.territories.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }
}
