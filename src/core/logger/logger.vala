/*
 *    Logger.vala
 *
 *    Copyright (C) 2021 concept10
 *
 *    This file is part of exoSCADA.
 *
 *    exoSCADA is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    exoSCADA is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with exoSCADA.  If not, see <http://www.gnu.org/licenses/>.
 */

 namespace Exo {
    public enum LogLevel {
      DEBUG,
      INFO,
      WARNING,
      ERROR,
      FATAL;
  
      public string to_string() {
        switch(this) {
          case DEBUG:
            return "DEBUG";
          case INFO:
            return "INFO";
          case WARNING:
            return "WARN";
          case ERROR:
            return "ERROR";
          case FATAL:
            return "FATAL";
          default:
            return "UNKOWN";
        }
      }
    }
    public class Logger : GLib.Object {
      public static LogLevel displayed_level {get; set; default = LogLevel.WARNING;}
      public static void log(LogLevel level, string message) {
        if(level < displayed_level) {
          return;
        }
        unowned FileStream s = level < LogLevel.ERROR ? stdout : stderr;
        s.printf("[%s] %s\n", level.to_string(), message);
      }
    }
  }
  