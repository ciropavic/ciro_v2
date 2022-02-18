window.addEventListener('message', function (event) {
  let item = event.data;

  if (item.response == 'openTarget') {
    $('.target-label').html('');
    $('.target-wrapper').show();
    $('.target-eye').css('color', '#0e7c5f');
  } else if (item.response == 'closeTarget') {
    $('.target-label').html('');
    $('.target-wrapper').hide();
  } else if (item.response == 'validTarget') {
    $('.target-label').html('');

    Object.values(item.data).forEach((item, index) => {
      index++;
      $('.target-label').append(
        `<div class='target-item' id='${index}'><i class='${item.icon} fa-fw fa-pull-left target-icon'></i>${item.label}</div>`
      );
      $(`#target-${index}`).hover((e) => {
        $(`#target-${index}`).css('color', e.type === 'mouseenter' ? '#16e4ae' : 'white');
      });
      $('#' + index).css('padding-top', '0.5vh');
    });

    $('.target-eye').css('color', '#16e4ae');
  } else if (item.response == 'leftTarget') {
    $('.target-label').html('');
    $('.target-eye').css('color', '#0e7c5f');
  }
});

$(document).on('mousedown', (event) => {
  $('.target-label').html('');
  $('.target-wrapper').hide();
  switch (event.which) {
    case 1: {
      const id = event.target.id
      if (id) $.post('https://qtarget/selectTarget', JSON.stringify(Number(id)));
      break;
    }
    case 3: {
      $.post('https://qtarget/closeTarget');
      break;
    }
  }
});
