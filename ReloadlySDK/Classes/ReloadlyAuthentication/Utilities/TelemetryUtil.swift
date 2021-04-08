//
//  TelemetryUtil.swift
//  ReloadlySDK
//
//  Created by Taras Markevych on 08.04.2021.
//

import UIKit

class TelemetryUtil {
    class func getTelemetry() -> String {
        let jsonString = """
            {"api-version": "application/com.reloadly.topups-v1+json","name": "reloadly-sdk-ios", "env": {"swift":"5.3", sdkName: "1.0.0"}}
        """
        let data = Data(jsonString.utf8)
        return data.base64EncodedString()
    }
}
