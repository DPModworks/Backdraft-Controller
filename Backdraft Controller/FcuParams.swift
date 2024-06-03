//  FcuParams.swift
//  Backdraft Controller
//
//  Created by Ben Pauza on 5/27/24.

import Foundation

struct FcuParams: Codable {
    var primaryMode: Int  // 0,1,2,3.... semi binary burst auto disable
    var secondaryMode: Int // ^
    var tertiaryMode: Int //^
    var dwell1: Int //time in ms
    var dwell2: Int
    var dwell3: Int
    var stiction: Int //time added to dwell on first shot after certain time unfired
    var stictionTimer: Int //how long it takes for stiction to occur
    var delay1: Int //time in ms between shots
    var delay2: Int
    var delay3: Int
    var tracer: Int //0 is no, 1 is yes
    var tracerAlwaysOn: Int //0 is no, 1 is yes
    var tracerPreDelay: Int //delay after tracer turns on before first shot is fired (if on time expired)
    var tracerOnTime: Int //time that tracer stays on after last shot
    var magwind: Int //0 is no, 1 is yes
    var magwindPreDelay: Int //delay after winder on before first shot is fired (if on time expired)
    var magwindOnTime: Int //time that the mag continues to wind after last shot
    var randomDelay: Int   //0 is off, 1-10: increasingly more random
    

    init(primaryMode: Int, secondaryMode: Int, tertiaryMode: Int, dwell1: Int, dwell2: Int, dwell3: Int,stiction: Int, stictionTimer: Int, delay1: Int, delay2: Int, delay3: Int, tracer: Int, tracerAlwaysOn: Int, tracerPreDelay: Int, tracerOnTime: Int, magwind: Int, magwindPreDelay: Int, magwindOnTime: Int, randomDelay: Int) {
        
        self.primaryMode = primaryMode
        self.secondaryMode = secondaryMode
        self.tertiaryMode = tertiaryMode
        self.dwell1 = dwell1
        self.dwell2 = dwell2
        self.dwell3 = dwell3
        self.stiction = stiction
        self.stictionTimer = stictionTimer
        self.delay1 = delay1
        self.delay2 = delay2
        self.delay3 = delay3
        self.tracer = tracer
        self.tracerAlwaysOn = tracerAlwaysOn
        self.tracerPreDelay = tracerPreDelay
        self.tracerOnTime = tracerOnTime
        self.magwind = magwind
        self.magwindPreDelay = magwindPreDelay
        self.magwindOnTime = magwindOnTime
        self.randomDelay = randomDelay

    }
}

