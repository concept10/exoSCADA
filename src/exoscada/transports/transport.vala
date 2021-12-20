// Create tcp transport/* transport.vala
                        *
                        * Copyright 2021 concept10 <tenthconcept@gmail.com>
                        *
                        * This program is free software: you can redistribute it and/or modify
                        * it under the terms of the GNU General Public License as published by
                        * the Free Software Foundation, either version 3 of the License, or
                        * (at your option) any later version.
                        *
                        * This program is distributed in the hope that it will be useful,
                        * but WITHOUT ANY WARRANTY; without even the implied warranty of
                        * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                        * GNU General Public License for more details.
                        *
                        * You should have received a copy of the GNU General Public License
                        * along with this program.  If not, see <http://www.gnu.org/licenses/>.
                        *
                        * SPDX-License-Identifier: GPL-3.0-or-later
                        */


public bool dcsActive() {

}

public bool transport_active() {
    switch (get_status()) {
        case exo.transport_active_global:
        case exo.transport_active_primary:
        case
            return true;
        
        default:
            return false;
    }
}
