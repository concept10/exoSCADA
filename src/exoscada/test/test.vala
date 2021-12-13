namespace LibBalistica {
    public class Atmosphere : GLib.Object {
        /**
         * Refraction
         *
         * @param Temperature
         * @param Pressure
         * @param RelativeHumidity
         *
         * @return Standardized refraction
         */
        private static double calc_fr(double Temperature, double Pressure, double RelativeHumidity)
        {
            double VPw = 4e-6 * Math.pow(Temperature, 3) - 0.0004 * Math.pow(Temperature, 2) + 0.0234 * Temperature - 0.2517;
            double FRH = 0.995 * (Pressure / (Pressure - (0.3783) * RelativeHumidity * VPw));
    
            debug("Standardized Refraction: %f", FRH);
            return (FRH);
        }
    
    
        /**
         * Pressure
         *
         * @param Pressure
         *
         * @return Standardized pressure
         */
        private static inline double calc_fp(double Pressure)
        {
            double FP = (Pressure - STANDARD_PRESSURE) / STANDARD_PRESSURE;
    
            debug("Standardized Pressure: %f", FP);
    
            return (FP);
        }
    
    