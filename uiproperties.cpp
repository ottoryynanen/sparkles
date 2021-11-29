#include "uiproperties.h"

static int s_minimum = 10;
static int s_maximum = 20;

UiProperties::UiProperties(QObject *parent)
    : QObject(parent)
    , m_lifeSpan(1000)
    , m_screenHeight(100)
    , m_screenWidth(100)
{
    m_magnitude = m_screenHeight / 5;
}

int UiProperties::getMinimum() const
{
    return s_minimum;
}

int UiProperties::getMaximum() const
{
    return s_maximum;
}

int UiProperties::getMagnitude() const
{
    return m_magnitude;
}

void UiProperties::setMagnitude(int newValue)
{
    if (s_maximum < newValue) {
        newValue = s_maximum;
    }
    if (s_minimum > newValue) {
        newValue = s_minimum;
    }
    if (m_magnitude != newValue) {
        m_magnitude = newValue;
        emit magnitudeChanged(m_magnitude);
    }
}

int UiProperties::getLifeSpan() const
{
    return m_lifeSpan;
}

void UiProperties::setLifeSpan(int newValue)
{
    if (newValue < 1000) {
        newValue = 1000;
    } else if (newValue > 5000) {
        newValue = 5000;
    }
    if (m_lifeSpan != newValue) {
        m_lifeSpan = newValue;
        emit lifeSpanChanged(m_lifeSpan);
    }
}

int UiProperties::getScreenHeight() const
{
    return m_screenHeight;
}

void UiProperties::setScreenHeight(int newValue)
{
    if (m_screenHeight != newValue) {
        m_screenHeight = newValue;
        emit screenHeightChanged(m_screenHeight);
        if (m_screenHeight < m_screenWidth) {
            s_maximum = m_screenWidth / 5;
        } else {
            s_maximum = m_screenHeight /5;
        }
        emit maximumChanged(s_maximum);
        /* Re-evaluate Magnitude */
        setMagnitude(getMagnitude());
    }
}

int UiProperties::getScreenWidth() const
{
    return m_screenWidth;
}

void UiProperties::setScreenWidth(int newValue)
{
    if (m_screenWidth != newValue) {
        m_screenWidth = newValue;
        emit screenWidthChanged(m_screenWidth);
        if (m_screenHeight < m_screenWidth) {
            s_maximum = m_screenWidth / 5;
        } else {
            s_maximum = m_screenHeight /5;
        }
        emit maximumChanged(s_maximum);
        /* Re-evaluate Magnitude */
        setMagnitude(getMagnitude());
    }
}
