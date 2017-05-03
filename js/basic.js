var timetocalc = new Date().getTime();
            var str = "";
            console.log("Start!!!");
            for (var i = 0; i < 50000000; i++) {
                Math.sqrt(i);
                Math.pow(i, 2.56);
                var j = i * 745;
                var string = i + "";
                string = string.concat(" kaka pipi"); // "Kaka pipi" is a kind of childly call in Dutch. 
                string = string.toUpperCase();
                if (i % 300 == 0) {
                    str = "";
                } else {
                    str += i.toString(16);
                }
            }
            timetocalc = new Date().getTime() - timetocalc;
            console.log("timetocalc(msec): " + timetocalc);
