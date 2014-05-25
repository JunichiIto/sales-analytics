class SandboxReport < Dossier::Report
  def sql
    "SELECT count(*) from sales_infos"
  end
end