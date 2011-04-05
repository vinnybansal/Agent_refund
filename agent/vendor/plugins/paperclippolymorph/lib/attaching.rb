class Attaching < ActiveRecord::Base
  belongs_to :asset, :counter_cache => true
  belongs_to :attachable, :polymorphic => true
  after_create :after_create_fn
  after_destroy :after_destroy_fn
  
  def after_create_fn
    if self.attachable.acts_as_polymorphic_paperclip_options[:counter_cache]
      self.attachable.class.increment_counter(:assets_count, self.attachable.id)
    end
  end
  
  def after_destroy_fn
    if self.attachable.acts_as_polymorphic_paperclip_options[:counter_cache]
      self.attachable.class.decrement_counter(:assets_count, self.attachable.id)
    end
  end
end
