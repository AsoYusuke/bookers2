<div class="col-md-3">
        <h2>User info</h2>

        <table class="table">
          <thead>
            <tr>
              <th>
              <%= attachment_image_tag @book.user, :profile_image, size: "100x100", format: 'jpeg', fallback: "no_image.jpg" %>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th>name:</th>
              <!--<th>name</th>-->
            </tr>
            <tr>
              <th>introduction:</th>
            <!--  <th>introduction</th>-->
            </tr>
          </tbody>
        </table>
        <div class="row">
          <% if @user.id == current_user.id %>
              <%= link_to "", edit_user_path(@user), class: "btn btn-outline-secondary btn-block fas fa-user-cog" %>
            <% end %>
        </div>

        <h2><strong>New book</strong></h2>
        <%= form_with model: @book, local:true do |f| %>
          <h6>Title</h6>
          <%= f.text_field :title, class: "col-xs-12 book_tetle" %>

          <h6>Opinion</h6>
          <%= f.text_area :body, class: "col-xs-12 book_body" %>
          <br>
            <%= f.submit 'Create Book', class: "btn btn-primary col-xs-12" %>
        <% end %>
      </div>