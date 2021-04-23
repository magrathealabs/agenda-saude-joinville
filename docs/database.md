# Estrutura de dados

## appointments

Agendamentos, funciona como uma agenda onde vagas podem ser abertas. Agendamentos podem estar tanto vagos (sem um `patient_id`) quanto preenchidos.

  * `start`: data e horário de início da vaga.
  * `end`: data e horário de fim da vaga.
  * `active`: se agendamento está ativo ou suspenso. Pode estar suspenso por problemas com o paciente (por exemplo a idade não condiz com seu documento de identidade), ou pode ser usado para suspender vagas futuras afim de criar uma reserva de vagas para imprevistos.
  * `ubs_id`: unidade onde este agendamento será feito.
  * `patient_id`: paciente. Se estiver em branco, é uma vaga disponível para agendamento.
  * `check_in`: data e horário do check in na unidade. É realizado quando o paciente chega, se apresenta e todos os documentos estão em ordem.
  * `check_out`: data e horeario de check out na unidade. É realizado quando o paciente recebeu a dose e saiu.
  * `suspend_reason`: motivo pelo qual esta dose foi suspença (pode não ter motivo).
  * `vaccine_name`: nome da vacina administrada ou agendada para o futuro, caso seja segunda dose. **A ser removido no futuro, mas por hora ainda usado.**

## doses

Doses administradas da vacina em pacientes.

  * `patient_id`: Paciente do qual esta dose foi administrada.
  * `appointment_id`: Agendamento no qual esta dose foi administrada. Útil para inferir em qual unidade (`ubs`) a dose foi realizada.
  * `vaccine_id`: Vacina que foi administrada.
  * `sequence_number`: Número da dose (1 para primeira dose, 2 para segunda dose, ...)
  * `created_at`: Data que a dose foi administrada.

## groups

Grupos do qual o paciente participa.

  * `name`: Nome do grupo. Exemplo: "Trabalhadores de Saúde".
  * `parent_group_id`: Se este elemento é "filho" de algum outro grupo. Por exemplo, "Enfermeiros" ser um filho de "Trabalhadores de Saúde".

## groups_patients

Tabela associativa entre `groups` e `patients`. É como sabemos quantos pacientes estão em quantos grupos.

## Neighborhoods

Bairros da cidade.

  * `name`: nome do bairro.

## neighborhoods_ubs

Tabela associativa entre `ubs` e `neighborhood`, já que unidades de atendimento podem atender múltiplos bairros da cidade.

## `patients`

Pacientes.

  * `email`:
  * `remember_created_at`:
  * `created_at`:
  * `updated_at`:
  * `name`:
  * `cpf`:
  * `mother_name`:
  * `birth_date`:
  * `phone`:
  * `other_phone`:
  * `sus`:
  * `neighborhood`:
  * `fake_mothers`:
  * `login_attempts`:
  * `bedridden`:
  * `main_ubs_id`:
  * `chronic`:
  * `target_audience`:
  * `public_place`:
  * `place_number`:
  * `specific_comorbidity`:
  * `neighborhood_id`:
  * `street_2`:
  * `internal_note`:

## time_slot_generation_configs

  * `content`:

## time_slot_generator_executions

  * `status`:
  * `details`:

## ubs

Unidades de saúde.

  * `name`:
  * `neighborhood`:
  * `user_id`:
  * `shift_start`:
  * `shift_end`:
  * `break_start`:
  * `break_end`:
  * `slot_interval_minutes`:
  * `created_at`:
  * `updated_at`:
  * `phone`:
  * `address`:
  * `cnes`:
  * `active`:
  * `open_saturday`:
  * `saturday_shift_start`:
  * `saturday_break_start`:
  * `saturday_break_end`:
  * `saturday_shift_end`:
  * `appointments_per_time_slot`:

## ubs_users

Tabela associativa entre `ubs` e `patients`.

## users

  * `email`:
  * `encrypted_password`:
  * `reset_password_token`:
  * `reset_password_sent_at`:
  * `remember_created_at`:
  * `name`: Nome do administrador, também usado como login.
  * `administrator`: Se usuário é administrador ou não.

## vaccines

Tipos de vacinas disponíveis no sistema.

  * `name`: Nome informal da vacina.
  * `formal_name`: Nome formal da vacina, a título informativo.
  * `second_dose_after_in_days`: Após quantos dias a segunda dose deve ser administrada. Pode ser `NULL~ se não houver segunda dose.
  * `third_dose_after_in_days`: Após quantos dias a terceira dose deve ser administrada. Pode ser `NULL` se não houver terceira dose.
  * `legacy_name`: Nome de legado, para migração de dados. A ser removida em breve.