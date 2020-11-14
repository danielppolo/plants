import 'select2';
import $ from 'jquery';

const initSelect = () => {
  if (document.querySelector('#plant_label_label_id')) {
    $('#plant_label_label_id').select2();
  }
}

export { initSelect }