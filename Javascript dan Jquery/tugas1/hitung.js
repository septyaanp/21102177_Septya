//Nama : Septya Andini Putri
//NIM  : 21102177

function hitungGanjil(min, max) {
    let bilanganGanjil = [];
    let total = 0;
  
    if (min % 2 === 0) min++;
  
    for (let i = min; i <= max; i += 2) {
      bilanganGanjil.push(i);
      total += i;
    }
  
    return { bilanganGanjil, total };
  }
  
  function tampilkanHasil(min, max) {
    const { bilanganGanjil, total } = hitungGanjil(min, max);
    
    console.log("=================================");
    console.log("OPERASI HITUNG BILANGAN GANJIL");
    console.log("=================================");
    console.log(`Rentang         : ${min} sampai ${max}`);
    console.log(`Bilangan Ganjil : ${bilanganGanjil.join(' + ')}`);
    console.log(`Total           : ${total}`);
    console.log("=================================");
    console.log(" ");
  }
  
  tampilkanHasil(1, 8);    
  tampilkanHasil(4, 15);  
  