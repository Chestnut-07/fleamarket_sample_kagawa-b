$(function(){

  function buildselectbox(children) {
    let boxes="";
    children.forEach(function(child){
      boxes += `
                <option value="${child.id}">${child.name}</option>
                `;
    });

    const select=`
    <select class="categories" required="required" name="category_id">
      <option value="">--選択してください--</option>
      ${boxes}
    </select>
    `
    return select
  }
  
  $('.RegistrationForm').on('change','.categories',function(){
    $(this).nextAll().remove()
    const category_id = $(this).val()

    $.ajax({
      type: "GET",
      url: "/api/items/categories",
      data: {category_id: category_id},
      dataType: 'json'
    })
    .done(function(children) {

      if(children.length==0){
        return false
      }

      const select_form = buildselectbox(children)
      const target = $('.Category')
      target.append(select_form)

    })
    .fail(function() {
    });
  })
});