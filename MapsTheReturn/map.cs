using Microsoft.Maui.Maps;
using System;
using System.Collections.Generic;

namespace MapsTheReturn
{
    public interface IElement
    {
        object Parent { get; }
        void OnParentSet();
    }

    public interface ITransform
    {
        double Scale { get; set; }
        double Rotation { get; set; }
        double TranslationX { get; set; }
        double TranslationY { get; set; }
    }

    public interface IMap
    {
        MapType MapType { get; set; }
        Location Center { get; set; }
        double ZoomLevel { get; set; }
        void MoveToRegion(MapSpan region);
    }

    public interface IView : IElement
    {
        double Width { get; set; }
        double Height { get; set; }
        void Measure(double availableWidth, double availableHeight);
    }

    // For managing map pins
    public interface IMapPin
    {
        Location Position { get; set; }
        string Label { get; set; }
    }

    public interface IMapPinCollection : IEnumerable<IMapPin> { }

    public class CustomMap : IMap
    {
        public MapType MapType { get; set; }
        public Location Center { get; set; }
        public double ZoomLevel { get; set; }

        public void MoveToRegion(MapSpan region)
        {
            // Logic to move the map's region (e.g., set new center and zoom)
        }
    }



    public class MapViewModel : BindableObject
    {
        private MapType _mapType;
        private Location _center;
        private double _zoomLevel;

        public MapType MapType
        {
            get => _mapType;
            set
            {
                _mapType = value;
                OnPropertyChanged();
            }
        }

        public Location Center
        {
            get => _center;
            set
            {
                _center = value;
                OnPropertyChanged();
            }
        }

        public double ZoomLevel
        {
            get => _zoomLevel;
            set
            {
                _zoomLevel = value;
                OnPropertyChanged();
            }
        }

        // Method to move map to a region
        public void MoveToRegion(MapSpan region)
        {
            Center = region.Center;
            ZoomLevel = region.LatitudeDegrees; // Simplified, you might want to calculate zoom
        }
    }

}
