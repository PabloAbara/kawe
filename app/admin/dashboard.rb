# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container" do
      h2 "Seguimiento del Roadmap X"
    end
      # @roadmap.checkpoints.each do |checkpoint|
      div class: "wrapper" do
        div class: "skill" do
          # h3 checkpoint.title
          h3 "Checkpoint 1"
          div class: "skill-bar skill1" do
            span class: "skill-count1" "95%"
          end
        end
      end
    # end
  end


end
