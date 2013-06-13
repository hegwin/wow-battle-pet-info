# coding: utf-8
namespace :data do
  desc 'import pet data from BLZ api'
  task :import_new, [:id_begin, :id_end] => :environment do |task, args|
    if args.id_begin && args.id_end
      blz_ids = args.id_begin.to_i..args.id_end.to_i

      blz_ids.each do |i|
        tried_times = 1
        begin
          bp = BattlePet.new i, :cn
          p bp
        rescue
          retry if tried_times <= 3
          tried_times += 1
          sleep 5
        end

        if bp
          unless Pet.find_by_blz_id(bp.id)
            category = Category.find_by_title_en(bp.type)
            params = { blz_id: bp.id, title_cn: bp.name, category_id: category.id, description: bp.description, icon_url: bp.icon_url, tag_list: bp.added_in_patch }

            bp.source.each do |k ,v|
              if Pet::SOURCES.include? k
                params.merge!({ source: k })
                break
              end
            end
            params[:source] = '未知来源' unless params[:source]
            params.merge!({ weather: bp.source['天气'], event: bp.source['世界事件'], season: bp.source['季节'] })

            p params
            pet = Pet.create params

            if zone_names = bp.source['地区'] || bp.source['宠物对战']
              zone_names.split('，').each do |zone_name|
                if zone = Zone.find_by_title_cn(zone_name)
                  zone.pets << pet
                end
              end
            end

          end
        end
      end
    end
  end
end
