$(document).ready(function() {
    $('#registrationForm').submit(function(e) {
        e.preventDefault();
        
        // Reset error states
        $('.error-message').hide();
        $('.form-control').removeClass('is-invalid');
        
        // Validate nama field
        if ($('#nama').val().trim() === '') {
            $('#nama').addClass('is-invalid');
            $('#namaError').show();
            return false;
        }
        
        // If validation passes
        alert('Form submitted successfully!');
        // You can add AJAX submission here
        // this.submit();
    });
    
    // Real-time validation while typing
    $('#nama').on('input', function() {
        if ($(this).val().trim() !== '') {
            $(this).removeClass('is-invalid');
            $('#namaError').hide();
        }
    });
});