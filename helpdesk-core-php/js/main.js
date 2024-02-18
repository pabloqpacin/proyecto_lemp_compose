
const getTeamMember = function (teamId){
    $.ajax({
        'url': './src/get-team-member.php',
        'type': 'post',
        'dataType': 'text',
        'data': {'id': teamId},
        'success': function(response){
            let result = JSON.parse(response);
            const options = [];
            let option = `<option value="none">--select--</option>`;
            options.push(option);
            for(let i = 0; i< result.length; i++){
                let option = `<option value="${result[i].id}">${result[i].name}</option>`;
                options.push(option);
            }

            $('#team-member-dropdown').html(options.join(''));

        }
    });
}


