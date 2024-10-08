local luasnip = require('luasnip')
--[[
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local function copy(args)
    return args[1]
end

luasnip.add_snippets('isabelle', {
  -- arrows
  s('\\Implies', { t('\\<Longrightarrow>') }),
  s('\\implies', { t('\\<longrightarrow>') }),
  s('\\To', { t('\\<Rightarrow>') }),
  s('\\to', { t('\\<rightarrow>') }),
  s('\\Iff', { t('\\<Longleftrightarrow>') }),
  s('\\iff', { t('\\<longleftrightarrow>') }),

  s('\\leftarrow', { t('\\<leftarrow>') }),
  s('\\longleftarrow', { t('\\<longleftarrow>') }),
  s('\\longlongleftarrow', { t('\\<longlongleftarrow>') }),
  s('\\longlonglongleftarrow', { t('\\<longlonglongleftarrow>') }),
  s('\\rightarrow', { t('\\<rightarrow>') }),
  s('\\longrightarrow', { t('\\<longrightarrow>') }),
  s('\\longlongrightarrow', { t('\\<longlongrightarrow>') }),
  s('\\longlonglongrightarrow', { t('\\<longlonglongrightarrow>') }),
  s('\\Leftarrow', { t('\\<Leftarrow>') }),
  s('\\Longleftarrow', { t('\\<Longleftarrow>') }),
  s('\\Lleftarrow', { t('\\<Lleftarrow>') }),
  s('\\Rightarrow', { t('\\<Rightarrow>') }),
  s('\\Longrightarrow', { t('\\<Longrightarrow>') }),
  s('\\Rrightarrow', { t('\\<Rrightarrow>') }),
  s('\\leftrightarrow', { t('\\<leftrightarrow>') }),
  s('\\longleftrightarrow', { t('\\<longleftrightarrow>') }),
  s('\\Leftrightarrow', { t('\\<Leftrightarrow>') }),
  s('\\Longleftrightarrow', { t('\\<Longleftrightarrow>') }),
  s('\\mapsto', { t('\\<mapsto>') }),
  s('\\longmapsto', { t('\\<longmapsto>') }),

  s('\\<-', { t('\\<leftarrow>') }),
  s('\\<--', { t('\\<longleftarrow>') }),
  s('\\<---', { t('\\<longlongleftarrow>') }),
  s('\\<----', { t('\\<longlonglongleftarrow>') }),
  s('\\->', { t('\\<rightarrow>') }),
  s('\\-->', { t('\\<longrightarrow>') }),
  s('\\--->', { t('\\<longlongrightarrow>') }),
  s('\\---->', { t('\\<longlonglongrightarrow>') }),
  s('\\<=', { t('\\<Leftarrow>') }),
  s('\\<==', { t('\\<Longleftarrow>') }),
  s('\\=>', { t('\\<Rightarrow>') }),
  s('\\==>', { t('\\<Longrightarrow>') }),
  s('\\<->', { t('\\<leftrightarrow>') }),
  s('\\<-->', { t('\\<longleftrightarrow>') }),
  s('\\<=>', { t('\\<Leftrightarrow>') }),
  s('\\<==>', { t('\\<Longleftrightarrow>') }),

  s('\\down', { t('\\<down>') }),
  s('\\Down', { t('\\<Down>') }),
  s('\\up', { t('\\<up>') }),
  s('\\Up', { t('\\<Up>') }),

  -- logic
  s('\\and', { t('\\<and>') }),
  s('\\And', { t('\\<And>') }),
  s('\\or', { t('\\<or>') }),
  s('\\Or', { t('\\<Or>') }),
  s('\\forall', { t('\\<forall>') }),
  s('\\exists', { t('\\<exists>') }),
  s('\\nexists', { t('\\<nexists>') }),
  s('\\not', { t('\\<not>') }),
  s('\\oplus', { t('\\<oplus>') }),

  -- sets
  s('\\in', { t('\\<in>') }),
  s('\\notin', { t('\\<notin>') }),
  s('\\subset', { t('\\<subset>') }),
  s('\\supset', { t('\\<supset>') }),
  s('\\subseteq', { t('\\<subseteq>') }),
  s('\\supseteq', { t('\\<supseteq>') }),
  s('\\inter', { t('\\<inter>') }),
  s('\\Inter', { t('\\<Inter>') }),
  s('\\union', { t('\\<union>') }),
  s('\\Union', { t('\\<Union>') }),
  s('\\emptyset', { t('\\<emptyset>') }),

  -- lattice shit
  s('\\sqinter', { t('\\<sqinter>') }),
  s('\\Sqinter', { t('\\<Sqinter>') }),
  s('\\squnion', { t('\\<squnion>') }),
  s('\\Squnion', { t('\\<Squnion>') }),

  s('\\glb', { t('\\<sqinter>') }),
  s('\\Glb', { t('\\<Sqinter>') }),
  s('\\lub', { t('\\<squnion>') }),
  s('\\Lub', { t('\\<Squnion>') }),

  s('\\meet', { t('\\<sqinter>') }),
  s('\\Meet', { t('\\<Sqinter>') }),
  s('\\join', { t('\\<squnion>') }),
  s('\\Join', { t('\\<Squnion>') }),

  s('\\top', { t('\\<top>') }),
  s('\\bottom', { t('\\<bottom>') }),

  -- relations
  s('\\noteq', { t('\\<noteq>') }),
  s('\\neq', { t('\\<noteq>') }),
  s('\\le', { t('\\<le>') }),
  s('\\ge', { t('\\<ge>') }),
  s('\\sim', { t('\\<sim>') }),
  s('\\equiv', { t('\\<equiv>') }),
  s('\\lessapprox', { t('\\<lessapprox>') }),

  -- brackets
  s('\\open', { t('\\<open>') }),
  s('\\close', { t('\\<close>') }),
  s('\\lbrakk', { t('\\<lbrakk>') }),
  s('\\rbrakk', { t('\\<rbrakk>') }),

  -- greek symbols
  s('\\alpha', { t('\\<alpha>') }),
  s('\\beta', { t('\\<beta>') }),
  s('\\Gamma', { t('\\<Gamma>') }),
  s('\\tau', { t('\\<tau>') }),

  s('\\alpha', { t('\\<alpha>') }),
  s('\\beta', { t('\\<beta>') }),
  s('\\gamma', { t('\\<gamma>') }),
  s('\\delta', { t('\\<delta>') }),
  s('\\epsilon', { t('\\<epsilon>') }),
  s('\\zeta', { t('\\<zeta>') }),
  s('\\eta', { t('\\<eta>') }),
  s('\\theta', { t('\\<theta>') }),
  s('\\iota', { t('\\<iota>') }),
  s('\\kappa', { t('\\<kappa>') }),
  s('\\lambda', { t('\\<lambda>') }),
  s('\\mu', { t('\\<mu>') }),
  s('\\nu', { t('\\<nu>') }),
  s('\\xi', { t('\\<xi>') }),
  s('\\pi', { t('\\<pi>') }),
  s('\\rho', { t('\\<rho>') }),
  s('\\sigma', { t('\\<sigma>') }),
  s('\\tau', { t('\\<tau>') }),
  s('\\upsilon', { t('\\<upsilon>') }),
  s('\\phi', { t('\\<phi>') }),
  s('\\chi', { t('\\<chi>') }),
  s('\\psi', { t('\\<psi>') }),
  s('\\omega', { t('\\<omega>') }),
  s('\\Gamma', { t('\\<Gamma>') }),
  s('\\Delta', { t('\\<Delta>') }),
  s('\\Theta', { t('\\<Theta>') }),
  s('\\Lambda', { t('\\<Lambda>') }),
  s('\\Xi', { t('\\<Xi>') }),
  s('\\Pi', { t('\\<Pi>') }),
  s('\\Sigma', { t('\\<Sigma>') }),
  s('\\Upsilon', { t('\\<Upsilon>') }),
  s('\\Phi', { t('\\<Phi>') }),
  s('\\Psi', { t('\\<Psi>') }),
  s('\\Omega', { t('\\<Omega>') }),

  -- other symbols
  s('\\turnstile', { t('\\<turnstile>') }),
  s('\\Turnstile', { t('\\<Turnstile>') }),
  s('\\stileturn', { t('\\<stileturn>') }),
  s('\\circ', { t('\\<circ>') }),
  s('\\dots', { t('\\<dots>') }),
  s('\\times', { t('\\<times>') }),
  s('\\infinity', { t('\\<infinity>') }),

  s('\\bar', { t('\\<bar>') }),

  -- numbers
  s('\\sub', { t('\\<^sub>') }),
  s('\\bsub', { t('\\<^bsub>') }),
  s('\\esub', { t('\\<^esub>') }),

  s('\\sup', { t('\\<^sup>') }),
  s('\\bsup', { t('\\<^bsup>') }),
  s('\\esup', { t('\\<^esup>') }),

  -- isabelle keywords
  s('simp', { t('simp') }),
  s('auto', { t('auto') }),
  s('force', { t('force') }),
  s('fastforce', { t('fastforce') }),
  s('blast', { t('blast') }),
  s('try0', { t('try0') }),
  s('sledgehammer', { t('sledgehammer') }),

  s('fun', {
      t('fun '),
      i(1),
      t(' :: "'),
      i(2),
      t({ '" where', '\t"' }),
      f(copy, 1),
      t(' '),
      i(3, '_'),
      t(' = '),
      i(4, 'undefined'),
      t('"'),
  }),
  s('inductive', {
      t('inductive '),
      i(1),
      t(' :: "'),
      i(2),
      t({ '" where', '\t"' }),
      i(3),
      t('"'),
  }),
  s('proof', {
      t('proof ('),
      i(1, 'induction'),
      t({ ')', '\t' }),
      i(2),
      t({ '', 'qed' }),
  }),
})
]]
