//
//  RoomFactory.swift
//  Ghosters
//

import Foundation
import CoreGraphics

struct RoomFactory {

    static func createDirtyLivingRoom() -> Room {

        let carpet = Furniture(
            name: "Carpet",
            uncleanImage: "carpet-Dirty",
            cleanedImage: "carpet-Clean",
            targetScore: 5,
            position: CGPoint(x: 0.50, y: 0.20),
            zPosition: 0,
            scale: 1.0
        )

        let fireplace = Furniture(
            name: "Fireplace",
            uncleanImage: "firePlace-Dirty",
            cleanedImage: "firePlace-Clean",
            targetScore: 15,
            position: CGPoint(x: 0.50, y: 0.58),
            zPosition: 1,
            scale: 1.0
        )

        let chair = Furniture(
            name: "Chair",
            uncleanImage: "sofa-Dirty",
            cleanedImage: "sofa-Clean",
            targetScore: 10,
            position: CGPoint(x: 0.30, y: 0.30),
            zPosition: 2,
            scale: 1.0
        )

        let table = Furniture(
            name: "Tea Table",
            uncleanImage: "teaTable-Dirty",
            cleanedImage: "teaTable-Clean",
            targetScore: 5,
            position: CGPoint(x: 0.52, y: 0.36),
            zPosition: 3,
            scale: 1.0
        )

        let candle = Furniture(
            name: "Candle",
            uncleanImage: "candel-Dirty",
            cleanedImage: "candel-Clean",
            targetScore: 5,
            position: CGPoint(x: 0.42, y: 0.62),
            zPosition: 4,
            scale: 1.0
        )

        let picture = Furniture(
            name: "Picture",
            uncleanImage: "picter-Dirty",
            cleanedImage: "picter-Clean",
            targetScore: 5,
            position: CGPoint(x: 0.50, y: 0.75),
            zPosition: 5,
            scale: 1.0
        )

        return Room(
            id: UUID(),
            name: "Living Room",
            backgroundImage: "packDirtyLivingRoom",
            isLocked: false,
            furnitureItems: [
                carpet,
                fireplace,
                chair,
                table,
                candle,
                picture
            ]
        )
    }
}
