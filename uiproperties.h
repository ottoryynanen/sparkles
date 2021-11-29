#ifndef UIPROPERTIES_H
#define UIPROPERTIES_H

#include <QObject>

class UiProperties : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int minimum READ getMinimum NOTIFY minimumChanged)
    Q_PROPERTY(int maximum READ getMaximum NOTIFY maximumChanged)
    Q_PROPERTY(int magnitude READ getMagnitude WRITE setMagnitude NOTIFY magnitudeChanged)
    Q_PROPERTY(int lifeSpan READ getLifeSpan WRITE setLifeSpan NOTIFY lifeSpanChanged)
    Q_PROPERTY(int screenHeight READ getScreenHeight WRITE setScreenHeight NOTIFY screenHeightChanged)
    Q_PROPERTY(int screenWidth READ getScreenWidth WRITE setScreenWidth NOTIFY screenWidthChanged)
public:
    explicit UiProperties(QObject *parent = nullptr);
    int getMinimum() const;
    int getMaximum() const;
    int getMagnitude() const;
    void setMagnitude(int newValue);
    int getLifeSpan() const;
    void setLifeSpan(int newValue);
    int getScreenHeight() const;
    void setScreenHeight(int newValue);
    int getScreenWidth() const;
    void setScreenWidth(int newValue);

signals:
    void minimumChanged(int);
    void maximumChanged(int);
    void magnitudeChanged(int);
    void lifeSpanChanged(int);
    void screenHeightChanged(int);
    void screenWidthChanged(int);

private:
    int m_magnitude;
    int m_lifeSpan;
    int m_screenHeight;
    int m_screenWidth;
};

#endif // UIPROPERTIES_H
