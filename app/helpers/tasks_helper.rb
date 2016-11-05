module TasksHelper

  def priorities_options
    %w[Baixa Normal Alta Máxima]
  end

  def author
    @task.user
  end
end
