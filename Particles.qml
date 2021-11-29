import QtQuick
import QtQuick.Particles
import QtQuick.Window

Rectangle {
    id: particleScreen
    color: "black"
    property int particleMagnitude: uiProperties.magnitude
    property int particleSize: particleScreen.particleMagnitude > 100 ? particleScreen.particleMagnitude / 20 : 6
    ParticleSystem {
        id: particles
        anchors.fill: parent
        ImageParticle {
            source: "particle.png"
            alpha: 0
            colorVariation: 0.6
        }
        Emitter {
            id: pulseEmitter
            x: parent.width/2
            y: 2*parent.height/3
            emitRate: 1000
            lifeSpan: uiProperties.lifespan
            enabled: false
            velocity: AngleDirection{magnitude: particleMagnitude ; angleVariation: 360}
            size: particleSize
            sizeVariation: 4
        }
    }
    MouseArea {
        anchors.fill: parent
        onPressed: {
            pulseEmitter.x = mouse.x;
            pulseEmitter.y = mouse.y;
            pulseEmitter.enabled = true;
        }
        onPositionChanged: {
            pulseEmitter.x = mouse.x;
            pulseEmitter.y = mouse.y;
        }
        onReleased: {
            pulseEmitter.enabled = false;
        }
    }
}
