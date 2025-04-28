document.getElementById('ageForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const nama = document.getElementById('nama').value;
    const umur = parseInt(document.getElementById('umur').value);
    const resultDiv = document.getElementById('result');
    
    let status = "Belum Dewasa";
    let className = "not-adult";
    
    if (umur >= 18) {
        status = "Dewasa";
        className = "adult";
    }
    
    resultDiv.innerHTML = `<strong>${nama}</strong>, umur ${umur} tahun: <strong>${status}</strong>`;
    resultDiv.className = `result ${className}`;
    resultDiv.style.display = 'block';
});