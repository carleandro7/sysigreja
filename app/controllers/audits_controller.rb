class AuditsController < ApplicationController
  def index
    @models = Audit.select("audits.auditable_type as nome_model").group("auditable_type").order("auditable_type ASC")
    if params[:nome]!=nil
      sql = ""
      if params["modelnome"] != "0"
          sql = "AND auditable_type = '"+params["modelnome"]+"'" 
      end
      @audits = Audit.select("audits.username, audits.auditable_type, audits.user_id, audits.action, audits.audited_changes, audits.id")
          .where("(audits.username LIKE  '%"+params[:nome].strip+"%' OR audits.audited_changes LIKE '%"+params[:nome].to_s.strip+"%') "+sql).order("audits.id DESC").page(params[:page]).per(20)
    else
        #@audits = nil
        @audits = Audit.select("audits.username, audits.auditable_type, audits.user_id, audits.action, audits.audited_changes, audits.id")
       .order("audits.id DESC").page(params[:page]).per(20)  
    end  
  end 

  def relatorio
    if params[:nome]!=nil
      sql = ""
      if params["modelnome"] != "0"
          sql = "AND auditable_type = '"+params["modelnome"]+"'" 
      end
      @audits = Audit.select("audits.username, audits.auditable_type, audits.user_id, audits.action, audits.audited_changes, audits.id, audits.auditable_id, audits.created_at")
          .where("(audits.username LIKE  '%"+params[:nome].strip+"%' OR audits.audited_changes LIKE '%"+params[:nome].to_s.strip+"%') "+sql).order("audits.id DESC")
    else
        #@audits = nil
        @audits = Audit.select("audits.username, audits.auditable_type, audits.user_id, audits.action, audits.audited_changes, audits.id, audits.auditable_id, audits.created_at")
       .order("audits.id DESC")
    end
    respond_to do |format|
      format.pdf do
          pdf = RelatorioAuditPdf.new(@audits, @view_context) 
          send_data pdf.render,
          filename: "relatorioauditoria.pdf", type: "application/pdf", disposition: "attachment"
      end 
    end
  end

end